@implementation NSError(VVError)

+ (id)errorWithDomain:()VVError code:localizedDescription:
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;

  v7 = a3;
  if (a5)
  {
    v8 = (objc_class *)MEMORY[0x24BDBCE70];
    v9 = a5;
    v10 = [v8 alloc];
    a5 = (void *)objc_msgSend(v10, "initWithObjectsAndKeys:", v9, *MEMORY[0x24BDD0FC8], 0);

  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v7, a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)errorWithStreamDomain:()VVError code:localizedDescription:
{
  id *v8;
  __CFString *v9;
  void *v10;
  const __CFString *v12;

  if (a3 == 1)
  {
    v8 = (id *)MEMORY[0x24BDD1128];
LABEL_9:
    v9 = (__CFString *)*v8;
    goto LABEL_10;
  }
  if (*MEMORY[0x24BDBD5B0] == a3)
  {
    v8 = (id *)MEMORY[0x24BDD1228];
    goto LABEL_9;
  }
  if (*MEMORY[0x24BDB76D0] == a3)
  {
    v8 = (id *)MEMORY[0x24BDD1010];
    goto LABEL_9;
  }
  if (a3 == 2)
  {
    v8 = (id *)MEMORY[0x24BDD1100];
    goto LABEL_9;
  }
  if (*MEMORY[0x24BDB76D8] == a3)
  {
    v9 = CFSTR("NetDB");
  }
  else
  {
    v12 = CFSTR("*Unknown*");
    if (a3 == -1)
      v12 = CFSTR("VVErrorDomain");
    if (*MEMORY[0x24BDB76E8] == a3)
      v9 = CFSTR("SystemConfiguration");
    else
      v9 = (__CFString *)v12;
  }
LABEL_10:
  objc_msgSend(a1, "errorWithDomain:code:localizedDescription:", v9, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqualToError:()VVError
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _BOOL8 v8;

  v4 = a3;
  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    v7 = objc_msgSend(a1, "code");
    v8 = v7 == objc_msgSend(v4, "code");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isStreamDomain:()VVError error:
{
  id *v6;
  __CFString *v7;
  void *v8;
  _BOOL8 v9;
  const __CFString *v11;

  if (a3 == 1)
  {
    v6 = (id *)MEMORY[0x24BDD1128];
  }
  else if (*MEMORY[0x24BDBD5B0] == a3)
  {
    v6 = (id *)MEMORY[0x24BDD1228];
  }
  else if (*MEMORY[0x24BDB76D0] == a3)
  {
    v6 = (id *)MEMORY[0x24BDD1010];
  }
  else
  {
    if (a3 != 2)
    {
      if (*MEMORY[0x24BDB76D8] == a3)
      {
        v7 = CFSTR("NetDB");
      }
      else
      {
        v11 = CFSTR("*Unknown*");
        if (a3 == -1)
          v11 = CFSTR("VVErrorDomain");
        if (*MEMORY[0x24BDB76E8] == a3)
          v7 = CFSTR("SystemConfiguration");
        else
          v7 = (__CFString *)v11;
      }
      goto LABEL_10;
    }
    v6 = (id *)MEMORY[0x24BDD1100];
  }
  v7 = (__CFString *)*v6;
  if (!v7)
    return 0;
LABEL_10:
  objc_msgSend(a1, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString isEqualToString:](v7, "isEqualToString:", v8))
    v9 = objc_msgSend(a1, "code") == a4;
  else
    v9 = 0;

  return v9;
}

- (BOOL)isPasswordMismatchError
{
  void *v2;
  int v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("VVErrorDomain"));

  return v3 && (unint64_t)(objc_msgSend(a1, "code") - 1006) > 0xFFFFFFFFFFFFFFFCLL;
}

- (BOOL)isExpiredPasswordError
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("VVErrorDomain")))
    v3 = objc_msgSend(a1, "code") == 1005;
  else
    v3 = 0;

  return v3;
}

- (BOOL)isNewPasswordError
{
  void *v2;
  int v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("VVErrorDomain"));

  return v3 && (objc_msgSend(a1, "code") & 0xFFFFFFFFFFFFFFF8) == 0x400;
}

- (BOOL)isInvalidSubscriberError
{
  void *v2;
  int v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("VVErrorDomain"));

  return v3 && objc_msgSend(a1, "code") == 1006;
}

- (BOOL)isConnectivityError
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _BOOL8 v7;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)_IsStreamErrorDomain___StreamDomains;
  if (!_IsStreamErrorDomain___StreamDomains)
  {
    v4 = objc_alloc(MEMORY[0x24BDBCF20]);
    v5 = objc_msgSend(v4, "initWithObjects:", CFSTR("*Unknown*"), CFSTR("SystemConfiguration"), CFSTR("NetDB"), *MEMORY[0x24BDD1100], *MEMORY[0x24BDD1010], *MEMORY[0x24BDD1228], *MEMORY[0x24BDD1128], 0);
    v6 = (void *)_IsStreamErrorDomain___StreamDomains;
    _IsStreamErrorDomain___StreamDomains = v5;

    v3 = (void *)_IsStreamErrorDomain___StreamDomains;
  }
  if ((objc_msgSend(v3, "containsObject:", v2) & 1) != 0)
    goto LABEL_4;
  if (!objc_msgSend(v2, "isEqualToString:", CFSTR("VVErrorDomain")))
  {
    v7 = 0;
    goto LABEL_9;
  }
  if (objc_msgSend(a1, "code") == 1011)
LABEL_4:
    v7 = 1;
  else
    v7 = objc_msgSend(a1, "code") == 1023;
LABEL_9:

  return v7;
}

- (BOOL)isServerError
{
  void *v2;
  int v3;
  uint64_t v4;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("VVErrorDomain"));

  if (!v3)
    return 0;
  v4 = objc_msgSend(a1, "code");
  return v4 == 1020 || (unint64_t)(v4 - 1017) < 2;
}

- (BOOL)isSecurityError
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDD1228]))
    v3 = objc_msgSend(a1, "code") == -9829;
  else
    v3 = 0;

  return v3;
}

- (uint64_t)shouldPresentErrorForTaskType:()VVError
{
  uint64_t v3;
  void *v5;

  v3 = 0;
  if (a3 > 7)
    return v3;
  if (((1 << a3) & 0xCC) != 0)
  {
    if ((objc_msgSend(a1, "isConnectivityError") & 1) == 0)
    {
      objc_msgSend(a1, "domain");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("VVErrorDomain")))
        v3 = objc_msgSend(a1, "isPasswordMismatchError") ^ 1;
      else
        v3 = 0;
LABEL_15:

      return v3;
    }
    return 1;
  }
  if (((1 << a3) & 0x12) != 0)
  {
    if ((objc_msgSend(a1, "isServerError") & 1) == 0)
      return objc_msgSend(a1, "isSecurityError");
    return 1;
  }
  if (a3 == 5)
  {
    objc_msgSend(a1, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VVErrorDomain")) & 1) != 0)
      v3 = 1;
    else
      v3 = objc_msgSend(a1, "isConnectivityError");
    goto LABEL_15;
  }
  return v3;
}

@end
