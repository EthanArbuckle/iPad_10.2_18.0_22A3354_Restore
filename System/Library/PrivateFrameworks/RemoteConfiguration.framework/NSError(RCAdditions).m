@implementation NSError(RCAdditions)

- (uint64_t)rc_shouldRetry
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("NSErrorRCAdditionsShouldRetry"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (uint64_t)rc_isNetworkUnavailableError
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("NSErrorRCAdditionsIsNetworkUnavailable"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)rc_isCancellationError
{
  void *v2;
  _BOOL8 v3;
  void *v4;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB32E8]) && objc_msgSend(a1, "code") == -999)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(a1, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("RCErrorDomain")))
      v3 = objc_msgSend(a1, "code") == 1;
    else
      v3 = 0;

  }
  return v3;
}

- (BOOL)rc_isServiceUnavailableError
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("RCErrorDomain")))
  {
    objc_msgSend(a1, "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("RCErrorHTTPStatusCode"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "unsignedIntegerValue") == 503;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)rc_isOperationThrottledError
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("RCErrorDomain")))
    v3 = objc_msgSend(a1, "code") == 8;
  else
    v3 = 0;

  return v3;
}

- (uint64_t)rc_isOfflineError
{
  return objc_msgSend(a1, "rc_isOfflineErrorOfflineReason:", 0);
}

- (uint64_t)rc_isOfflineErrorOfflineReason:()RCAdditions
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v13;

  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "code");
  v13 = 0;
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("RCErrorDomain")))
  {
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB32E8]) && (v6 == -1018 || v6 == -1009))
      goto LABEL_8;
LABEL_9:
    objc_msgSend(a1, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      v9 = objc_msgSend(v11, "rc_isOfflineErrorOfflineReason:", &v13);
    else
      v9 = 0;

    goto LABEL_13;
  }
  if (v6 != 7)
    goto LABEL_9;
  objc_msgSend(a1, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RCErrorOfflineReasonKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v8, "unsignedIntegerValue");
  if (v13)
  {
    v9 = 1;
    goto LABEL_13;
  }
LABEL_8:
  v9 = 1;
  v13 = 1;
LABEL_13:
  if (a3)
    *a3 = v13;

  return v9;
}

@end
