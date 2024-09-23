@implementation CEMManagementTestCommandCommand

- (id)dmf_executeRequestWithContext:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[3];

  v5 = (void *)objc_opt_new(DMFEchoRequest);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CEMManagementTestCommandCommand payloadEcho](self, "payloadEcho"));
  objc_msgSend(v5, "setEcho:", v6);

  v13[0] = CFSTR("Executed");
  v13[1] = CFSTR("Failed");
  v14[0] = DMFRMEchoStatusOK;
  v14[1] = DMFRMEchoStatusFail;
  v13[2] = CFSTR("Pending");
  v14[2] = DMFRMEchoStatusPending;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 3));
  v8 = objc_claimAutoreleasedReturnValue(-[CEMManagementTestCommandCommand payloadReturnStatus](self, "payloadReturnStatus"));
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = CFSTR("Executed");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v10));
  objc_msgSend(v5, "setResultStatus:", v11);

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
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  void *v11;

  v4 = a3;
  v6 = objc_opt_class(DMFEchoResultObject, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v10 = CFSTR("Echo");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "echo"));
    v11 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
