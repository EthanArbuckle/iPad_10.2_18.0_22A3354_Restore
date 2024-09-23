@implementation SDPromptDelegate

- (id)description
{
  unint64_t v3;
  const char *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[SDPromptDelegate openIssueFiler](self, "openIssueFiler");
  if (v3 > 2)
    v4 = "unknown";
  else
    v4 = off_100099970[v3];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDPromptDelegate diagnosticID](self, "diagnosticID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDPromptDelegate bundleID](self, "bundleID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("diagnosticID: %@, bundleID %@, issueFilerStatus %s, early %d, partnerTimeout %d, isResponse %d"), v5, v6, v4, -[SDPromptDelegate isEarlyPrompt](self, "isEarlyPrompt"), -[SDPromptDelegate didPartnerTimeout](self, "didPartnerTimeout"), -[SDPromptDelegate isCoSysdiagnoseResponse](self, "isCoSysdiagnoseResponse")));

  return v7;
}

- (id)copy
{
  SDPromptDelegate *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v3 = objc_alloc_init(SDPromptDelegate);
  -[SDPromptDelegate setIsCoSysdiagnoseResponse:](v3, "setIsCoSysdiagnoseResponse:", -[SDPromptDelegate isCoSysdiagnoseResponse](self, "isCoSysdiagnoseResponse"));
  -[SDPromptDelegate setDidPartnerTimeout:](v3, "setDidPartnerTimeout:", -[SDPromptDelegate didPartnerTimeout](self, "didPartnerTimeout"));
  -[SDPromptDelegate setIsEarlyPrompt:](v3, "setIsEarlyPrompt:", -[SDPromptDelegate isEarlyPrompt](self, "isEarlyPrompt"));
  -[SDPromptDelegate setOpenIssueFiler:](v3, "setOpenIssueFiler:", -[SDPromptDelegate openIssueFiler](self, "openIssueFiler"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDPromptDelegate diagnosticID](self, "diagnosticID"));
  v5 = objc_msgSend(v4, "copy");
  -[SDPromptDelegate setDiagnosticID:](v3, "setDiagnosticID:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDPromptDelegate bundleID](self, "bundleID"));
  v7 = objc_msgSend(v6, "copy");
  -[SDPromptDelegate setBundleID:](v3, "setBundleID:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDPromptDelegate ttrOverrideURLStr](self, "ttrOverrideURLStr"));
  v9 = objc_msgSend(v8, "copy");
  -[SDPromptDelegate setTtrOverrideURLStr:](v3, "setTtrOverrideURLStr:", v9);

  return v3;
}

- (BOOL)isEarlyPrompt
{
  return self->_isEarlyPrompt;
}

- (void)setIsEarlyPrompt:(BOOL)a3
{
  self->_isEarlyPrompt = a3;
}

- (BOOL)didPartnerTimeout
{
  return self->_didPartnerTimeout;
}

- (void)setDidPartnerTimeout:(BOOL)a3
{
  self->_didPartnerTimeout = a3;
}

- (BOOL)isCoSysdiagnoseResponse
{
  return self->_isCoSysdiagnoseResponse;
}

- (void)setIsCoSysdiagnoseResponse:(BOOL)a3
{
  self->_isCoSysdiagnoseResponse = a3;
}

- (int64_t)openIssueFiler
{
  return self->_openIssueFiler;
}

- (void)setOpenIssueFiler:(int64_t)a3
{
  self->_openIssueFiler = a3;
}

- (NSString)diagnosticID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDiagnosticID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)ttrOverrideURLStr
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTtrOverrideURLStr:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ttrOverrideURLStr, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_diagnosticID, 0);
}

@end
