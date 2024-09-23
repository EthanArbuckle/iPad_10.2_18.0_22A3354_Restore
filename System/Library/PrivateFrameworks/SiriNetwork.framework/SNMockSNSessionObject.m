@implementation SNMockSNSessionObject

- (NSString)refId
{
  return 0;
}

- (void)setDispatchData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void)setSerializedAceDataError:(id)a3
{
  objc_storeStrong((id *)&self->serializedAceDataError, a3);
}

- (BOOL)siriCore_supportedByLocalSession
{
  return 0;
}

- (BOOL)bufferingAllowedDuringActiveSession
{
  return 1;
}

- (BOOL)isProvisional
{
  return 0;
}

- (BOOL)isRestartable
{
  return 1;
}

- (BOOL)isRetryable
{
  return 1;
}

- (id)serializedAceDataError:(id *)a3
{
  if (a3)
    *a3 = objc_retainAutorelease(self->serializedAceDataError);
  return self->_data;
}

- (id)sessionRequestId
{
  return 0;
}

- (BOOL)supportedByLocalSession
{
  return 0;
}

- (BOOL)supportedByRemoteLimitedSession
{
  return 0;
}

- (NSString)aceId
{
  return self->aceId;
}

- (void)setAceId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->aceId, 0);
  objc_storeStrong((id *)&self->serializedAceDataError, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
