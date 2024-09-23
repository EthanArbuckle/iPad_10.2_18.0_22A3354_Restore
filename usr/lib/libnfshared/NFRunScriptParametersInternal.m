@implementation NFRunScriptParametersInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *seid;
  id v5;

  seid = self->_seid;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", seid, CFSTR("seid"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_checkAIDAllowList, CFSTR("checkAIDAllowList"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_AIDAllowList, CFSTR("AIDAllowList"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_initialSelectBeforeRun, CFSTR("initialSelectBeforeRun"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_includeAPDUDuration, CFSTR("includeAPDUDuration"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_deactivateAllApps, CFSTR("deactivateAllApps"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_toSystemOS, CFSTR("systemOS"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_disableCompletionNotification, CFSTR("disableCompletionNotification"));

}

- (NFRunScriptParametersInternal)initWithCoder:(id)a3
{
  id v4;
  NFRunScriptParametersInternal *v5;
  uint64_t v6;
  NSString *seid;
  uint64_t v8;
  NSArray *AIDAllowList;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFRunScriptParametersInternal;
  v5 = -[NFRunScriptParametersInternal init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("seid"));
    v6 = objc_claimAutoreleasedReturnValue();
    seid = v5->_seid;
    v5->_seid = (NSString *)v6;

    v5->_checkAIDAllowList = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("checkAIDAllowList"));
    +[NFNSCheckedDecoder coder:decodeArrayOfClass:forKey:](NFNSCheckedDecoder, "coder:decodeArrayOfClass:forKey:", v4, objc_opt_class(), CFSTR("AIDAllowList"));
    v8 = objc_claimAutoreleasedReturnValue();
    AIDAllowList = v5->_AIDAllowList;
    v5->_AIDAllowList = (NSArray *)v8;

    v5->_initialSelectBeforeRun = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("initialSelectBeforeRun"));
    v5->_includeAPDUDuration = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeAPDUDuration"));
    v5->_deactivateAllApps = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("deactivateAllApps"));
    v5->_toSystemOS = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("systemOS"));
    v5->_disableCompletionNotification = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("disableCompletionNotification"));
  }

  return v5;
}

- (NSString)seid
{
  return self->_seid;
}

- (void)setSeid:(id)a3
{
  objc_storeStrong((id *)&self->_seid, a3);
}

- (BOOL)checkAIDAllowList
{
  return self->_checkAIDAllowList;
}

- (void)setCheckAIDAllowList:(BOOL)a3
{
  self->_checkAIDAllowList = a3;
}

- (NSArray)AIDAllowList
{
  return self->_AIDAllowList;
}

- (void)setAIDAllowList:(id)a3
{
  objc_storeStrong((id *)&self->_AIDAllowList, a3);
}

- (BOOL)initialSelectBeforeRun
{
  return self->_initialSelectBeforeRun;
}

- (void)setInitialSelectBeforeRun:(BOOL)a3
{
  self->_initialSelectBeforeRun = a3;
}

- (BOOL)includeAPDUDuration
{
  return self->_includeAPDUDuration;
}

- (void)setIncludeAPDUDuration:(BOOL)a3
{
  self->_includeAPDUDuration = a3;
}

- (BOOL)deactivateAllApps
{
  return self->_deactivateAllApps;
}

- (void)setDeactivateAllApps:(BOOL)a3
{
  self->_deactivateAllApps = a3;
}

- (BOOL)toSystemOS
{
  return self->_toSystemOS;
}

- (void)setToSystemOS:(BOOL)a3
{
  self->_toSystemOS = a3;
}

- (BOOL)disableCompletionNotification
{
  return self->_disableCompletionNotification;
}

- (void)setDisableCompletionNotification:(BOOL)a3
{
  self->_disableCompletionNotification = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_AIDAllowList, 0);
  objc_storeStrong((id *)&self->_seid, 0);
}

@end
