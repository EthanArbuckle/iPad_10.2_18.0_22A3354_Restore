@implementation NSError(RBSErrors)

- (BOOL)rbs_isPermanentFailure
{
  _BOOL8 result;
  void *v3;
  void *v4;
  uint64_t v5;

  result = -[NSError rbs_isServiceDenied](a1);
  if (result)
  {
    objc_msgSend(a1, "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "valueForKey:", CFSTR("RBSPermanent"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    return v5;
  }
  return result;
}

+ (id)rbs_errorClientNotEntitled:()RBSErrors permanent:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", CFSTR("Client not entitled"), *MEMORY[0x1E0CB2D68]);
  if (v5)
    objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("RBSEntitlement"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("RBSPermanent"));

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RBSServiceErrorDomain"), 1, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)rbs_errorClientNotAuthorized
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKey:", CFSTR("Client not authorized"), *MEMORY[0x1E0CB2D68]);
  objc_msgSend(v0, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("RBSPermanent"));
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RBSServiceErrorDomain"), 1, v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

@end
