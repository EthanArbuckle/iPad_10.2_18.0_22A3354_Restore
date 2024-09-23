@implementation WLKUserSettingsRequestOperation

- (WLKUserSettingsRequestOperation)initWithAction:(unint64_t)a3 userSettings:(id)a4
{
  return -[WLKUserSettingsRequestOperation initWithAction:userSettings:caller:](self, "initWithAction:userSettings:caller:", a3, a4, 0);
}

- (WLKUserSettingsRequestOperation)initWithAction:(unint64_t)a3 userSettings:(id)a4 caller:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  WLKUserSettingsRequestOperation *v12;
  WLKUserSettingsRequestOperation *v13;
  uint64_t v14;
  WLKUserSettings *userSettings;
  uint64_t v16;
  NSString *caller;
  objc_super v19;

  v8 = a4;
  v9 = a5;
  if (a3 == 1)
  {
    WLKRequireNonNilParameter((uint64_t)v8);
    objc_msgSend(v8, "_patchData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[WLKURLRequestProperties requestPropertiesWithEndpoint:queryParameters:httpMethod:httpBody:headers:caller:timeout:apiVersion:options:](WLKURLRequestProperties, "requestPropertiesWithEndpoint:queryParameters:httpMethod:httpBody:headers:caller:timeout:apiVersion:options:", CFSTR("user/settings"), 0, CFSTR("PATCH"), v11, &unk_1E68CA0C8, v9, 0, &unk_1E68C9968, 0x200000);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid action provided (%ld)"), a3);
    v10 = 0;
  }
  else
  {
    +[WLKURLRequestProperties requestPropertiesWithEndpoint:queryParameters:httpMethod:httpBody:headers:caller:timeout:apiVersion:options:](WLKURLRequestProperties, "requestPropertiesWithEndpoint:queryParameters:httpMethod:httpBody:headers:caller:timeout:apiVersion:options:", CFSTR("user/settings"), 0, CFSTR("GET"), 0, 0, v9, 0, &unk_1E68C9968, 2097160);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19.receiver = self;
  v19.super_class = (Class)WLKUserSettingsRequestOperation;
  v12 = -[WLKUTSNetworkRequestOperation initWithRequestProperties:](&v19, sel_initWithRequestProperties_, v10);
  v13 = v12;
  if (v12)
  {
    v12->_action = a3;
    v14 = objc_msgSend(v8, "copy");
    userSettings = v13->_userSettings;
    v13->_userSettings = (WLKUserSettings *)v14;

    v16 = objc_msgSend(v9, "copy");
    caller = v13->_caller;
    v13->_caller = (NSString *)v16;

  }
  return v13;
}

- (void)processResponse
{
  void *v3;
  WLKUserSettings *v4;
  WLKUserSettings *response;
  WLKDictionaryResponseProcessor *v6;

  v6 = objc_alloc_init(WLKDictionaryResponseProcessor);
  -[WLKDictionaryResponseProcessor setObjectClass:](v6, "setObjectClass:", objc_opt_class());
  -[WLKNetworkRequestOperation data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKDictionaryResponseProcessor processResponseData:error:](v6, "processResponseData:error:", v3, 0);
  v4 = (WLKUserSettings *)objc_claimAutoreleasedReturnValue();
  response = self->_response;
  self->_response = v4;

}

- (unint64_t)action
{
  return self->_action;
}

- (WLKUserSettings)userSettings
{
  return self->_userSettings;
}

- (NSString)caller
{
  return self->_caller;
}

- (WLKUserSettings)response
{
  return self->_response;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_caller, 0);
  objc_storeStrong((id *)&self->_userSettings, 0);
}

@end
