@implementation WFBaseRemoteQuarantineRequest

- (WFBaseRemoteQuarantineRequest)init
{
  WFBaseRemoteQuarantineRequest *v2;
  void *v3;
  uint64_t v4;
  NSString *appVersion;
  void *v6;
  uint64_t v7;
  NSString *osVersion;
  void *v9;
  uint64_t v10;
  NSString *userLocale;
  WFBaseRemoteQuarantineRequest *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)WFBaseRemoteQuarantineRequest;
  v2 = -[MTLModel init](&v14, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForInfoDictionaryKey:", CFSTR("CFBundleShortVersionString"));
    v4 = objc_claimAutoreleasedReturnValue();
    appVersion = v2->_appVersion;
    v2->_appVersion = (NSString *)v4;

    objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemVersion");
    v7 = objc_claimAutoreleasedReturnValue();
    osVersion = v2->_osVersion;
    v2->_osVersion = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localeIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    userLocale = v2->_userLocale;
    v2->_userLocale = (NSString *)v10;

    v12 = v2;
  }

  return v2;
}

- (NSString)policyFunctionName
{
  return (NSString *)&stru_1E7AFA810;
}

- (NSString)defaultLocalizedPromptTitle
{
  return 0;
}

- (NSString)defaultLocalizedPromptMessage
{
  return 0;
}

- (NSString)defaultLocalizedDeniedErrorTitle
{
  return 0;
}

- (NSString)defaultLocalizedDeniedErrorMessage
{
  return 0;
}

- (id)javaScriptCoreRepresentationWithError:(id *)a3
{
  return +[MTLJSONAdapter JSONDictionaryFromModel:error:](MTLJSONAdapter, "JSONDictionaryFromModel:error:", self, a3);
}

- (NSString)appVersion
{
  return self->_appVersion;
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (NSString)userLocale
{
  return self->_userLocale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userLocale, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_appVersion, 0);
}

+ (id)JSONKeyPathsByPropertyKey
{
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("appVersion");
  v3[1] = CFSTR("osVersion");
  v4[0] = CFSTR("appVersion");
  v4[1] = CFSTR("osVersion");
  v3[2] = CFSTR("userLocale");
  v4[2] = CFSTR("userLocale");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
