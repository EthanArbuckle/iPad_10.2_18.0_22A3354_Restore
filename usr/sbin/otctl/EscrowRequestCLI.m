@implementation EscrowRequestCLI

- (EscrowRequestCLI)initWithEscrowRequest:(id)a3
{
  id v5;
  EscrowRequestCLI *v6;
  EscrowRequestCLI *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EscrowRequestCLI;
  v6 = -[EscrowRequestCLI init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_escrowRequest, a3);

  return v7;
}

- (int)trigger
{
  void *v2;
  id v3;
  id v4;
  int v5;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowRequestCLI escrowRequest](self, "escrowRequest"));
  v7 = 0;
  objc_msgSend(v2, "triggerEscrowUpdate:error:", CFSTR("cli"), &v7);
  v3 = v7;

  if (v3)
  {
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description")));
    printf("Errored: %s", (const char *)objc_msgSend(v4, "UTF8String"));

    v5 = 1;
  }
  else
  {
    puts("Complete.");
    v5 = 0;
  }

  return v5;
}

- (int)status
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  int v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  id v12;
  const char *v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  _BYTE v22[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowRequestCLI escrowRequest](self, "escrowRequest"));
  v21 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fetchStatuses:", &v21));
  v4 = v21;

  if (v4)
  {
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description")));
    printf("Errored: %s\n", (const char *)objc_msgSend(v5, "UTF8String"));

    v6 = 1;
  }
  else
  {
    if (objc_msgSend(v3, "count"))
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(_QWORD *)v18 != v10)
              objc_enumerationMutation(v7);
            v12 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i));
            v13 = (const char *)objc_msgSend(v12, "UTF8String");
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v12));
            v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "description")));
            printf("Request %s: %s\n", v13, (const char *)objc_msgSend(v15, "UTF8String"));

          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        }
        while (v9);
      }

    }
    else
    {
      puts("No requests are waiting for a passcode.");
    }
    v6 = 0;
  }

  return v6;
}

- (int)reset
{
  void *v2;
  id v3;
  id v4;
  int v5;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowRequestCLI escrowRequest](self, "escrowRequest"));
  v7 = 0;
  objc_msgSend(v2, "resetAllRequests:", &v7);
  v3 = v7;

  if (v3)
  {
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description")));
    printf("Errored: %s\n", (const char *)objc_msgSend(v4, "UTF8String"));

    v5 = 1;
  }
  else
  {
    puts("Complete.");
    v5 = 0;
  }

  return v5;
}

- (int)storePrerecordsInEscrow
{
  void *v2;
  unsigned int v3;
  id v4;
  id v5;
  int v6;
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowRequestCLI escrowRequest](self, "escrowRequest"));
  v8 = 0;
  v3 = objc_msgSend(v2, "storePrerecordsInEscrow:", &v8);
  v4 = v8;

  if (v4)
  {
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description")));
    printf("Errored: %s\n", (const char *)objc_msgSend(v5, "UTF8String"));

    v6 = 1;
  }
  else
  {
    printf("Complete: %d records written.\n", v3);
    v6 = 0;
  }

  return v6;
}

- (SecEscrowRequest)escrowRequest
{
  return (SecEscrowRequest *)objc_getProperty(self, a2, 8, 1);
}

- (void)setEscrowRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_escrowRequest, 0);
}

@end
