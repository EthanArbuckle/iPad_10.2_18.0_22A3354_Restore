@implementation _LTDSELFLoggingSessionIdProvider

- (SISchemaUUID)sessionId
{
  void *v3;
  NSDate *v4;
  double v5;
  SISchemaUUID *v6;
  NSObject *v7;
  id v8;
  id v9;
  SISchemaUUID *v10;
  SISchemaUUID *cachedSessionId;
  SISchemaUUID *v12;

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_dateSessionIdMostRecentlyAccessesOrCreated;
  objc_storeStrong((id *)&self->_dateSessionIdMostRecentlyAccessesOrCreated, v3);
  if (!v4)
  {
LABEL_6:
    v8 = objc_alloc(MEMORY[0x24BE95C78]);
    v9 = objc_alloc_init(MEMORY[0x24BDD1880]);
    v10 = (SISchemaUUID *)objc_msgSend(v8, "initWithNSUUID:", v9);
    cachedSessionId = self->_cachedSessionId;
    self->_cachedSessionId = v10;

    v6 = self->_cachedSessionId;
    goto LABEL_7;
  }
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = self->_cachedSessionId;
  if (!v6 || v5 >= 480.0)
  {
    v7 = _LTOSLogSELFLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[_LTDSELFLoggingSessionIdProvider sessionId].cold.1(v7);
    goto LABEL_6;
  }
LABEL_7:
  v12 = v6;

  return v12;
}

- (NSDate)dateSessionIdMostRecentlyAccessesOrCreated
{
  return self->_dateSessionIdMostRecentlyAccessesOrCreated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateSessionIdMostRecentlyAccessesOrCreated, 0);
  objc_storeStrong((id *)&self->_cachedSessionId, 0);
}

- (void)sessionId
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 134217984;
  v2 = 0x407E000000000000;
  _os_log_debug_impl(&dword_2491B9000, log, OS_LOG_TYPE_DEBUG, "It is been more than %f@ seconds, generating new SELF logging session id", (uint8_t *)&v1, 0xCu);
}

@end
