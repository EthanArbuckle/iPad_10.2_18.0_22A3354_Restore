@implementation CEMDeviceLockCommand

- (id)dmf_executeRequestWithContext:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_opt_new(DMFLockDeviceRequest);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CEMDeviceLockCommand payloadMessage](self, "payloadMessage"));
  objc_msgSend(v5, "setMessage:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CEMDeviceLockCommand payloadPhoneNumber](self, "payloadPhoneNumber"));
  objc_msgSend(v5, "setPhoneNumber:", v7);

  return v5;
}

- (id)dmf_executeOperationWithContext:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)dmf_requestExecutesWithoutReturning
{
  return 0;
}

- (id)dmf_statusForResult:(id)a3 context:(id)a4
{
  return 0;
}

@end
