@implementation SPRMonitorManager

- (BOOL)storeAuditLog:(id)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend_errorWithCode_(SPRError, a2, 7002, (uint64_t)a4, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && v7)
  {
    objc_msgSend_errorWithCode_(SPRError, v8, 7002, v9, v10, v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)sendAuditLogsAndReturnError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend_errorWithCode_(SPRError, a2, 7002, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 && v7)
  {
    objc_msgSend_errorWithCode_(SPRError, v8, 7002, v9, v10, v11);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)sendIncidentLog:(id)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend_errorWithCode_(SPRError, a2, 7002, (uint64_t)a4, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && v7)
  {
    objc_msgSend_errorWithCode_(SPRError, v8, 7002, v9, v10, v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)ping
{
  return 0;
}

- (BOOL)start
{
  return 0;
}

- (BOOL)stop
{
  return 0;
}

@end
