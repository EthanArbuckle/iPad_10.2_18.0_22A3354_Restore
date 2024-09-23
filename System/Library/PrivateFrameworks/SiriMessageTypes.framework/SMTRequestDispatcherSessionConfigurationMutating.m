@implementation SMTRequestDispatcherSessionConfigurationMutating

- (NSString)assistantId
{
  return self->_assistantId;
}

- (void)setAssistantId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)understandingOnDevice
{
  return self->_understandingOnDevice;
}

- (void)setUnderstandingOnDevice:(BOOL)a3
{
  self->_understandingOnDevice = a3;
}

- (NSString)sharedUserId
{
  return self->_sharedUserId;
}

- (void)setSharedUserId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[1].var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)setClientAuditToken:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_clientAuditToken.val[4] = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_clientAuditToken.val = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedUserId, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_assistantId, 0);
}

@end
