@implementation SSAuthenticationResponse

- (SSAuthenticationResponse)initWithURLResponse:(id)a3 dictionary:(id)a4
{
  id v6;
  id v7;
  SSAuthenticationResponse *v8;
  uint64_t v9;
  NSDictionary *responseDictionary;
  uint64_t v11;
  NSHTTPURLResponse *urlResponse;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SSAuthenticationResponse;
  v8 = -[SSAuthenticationResponse init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    responseDictionary = v8->_responseDictionary;
    v8->_responseDictionary = (NSDictionary *)v9;

    v11 = objc_msgSend(v6, "copy");
    urlResponse = v8->_urlResponse;
    v8->_urlResponse = (NSHTTPURLResponse *)v11;

  }
  return v8;
}

- (int64_t)accountKind
{
  void *v2;
  int64_t v3;

  -[SSAuthenticationResponse _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("accountKind"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "intValue") == 1;

  return v3;
}

- (NSString)accountName
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  -[SSAuthenticationResponse _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("appleId"), CFSTR("accountName"), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (v4 = v3, (v5 = v4) == 0))
  {
    -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("personInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("acAccountName"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v3 = v7;
        v5 = v3;
      }
      else
      {
        v5 = 0;
        v3 = v7;
      }
    }
    else
    {
      v5 = 0;
    }

    v4 = v3;
  }

  return (NSString *)v5;
}

- (NSNumber)accountUniqueIdentifier
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("dsPersonId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SSAccountGetUniqueIdentifierFromValue(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (id)altDSID
{
  void *v2;
  id v3;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("altDsid"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (int64_t)availableServiceTypes
{
  void *v2;
  int64_t v3;

  -[SSAuthenticationResponse _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("is-cloud-enabled"), CFSTR("is-saga-enabled"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (objc_msgSend(v2, "BOOLValue"))
      v3 = 4;
    else
      v3 = 0;
  }

  return v3;
}

- (NSString)creditsString
{
  void *v2;
  id v3;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("creditDisplay"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return (NSString *)v3;
}

- (int64_t)enabledServiceTypes
{
  void *v2;
  int64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[SSAuthenticationResponse _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("services"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v11 = v2;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v3 = 0;
      v7 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (objc_msgSend(v9, "isEqualToString:", CFSTR("locker")))
            {
              v3 |= 4uLL;
            }
            else if (objc_msgSend(v9, "isEqualToString:", CFSTR("purchase-history")))
            {
              v3 |= 2uLL;
            }
            else
            {
              v3 |= objc_msgSend(v9, "isEqualToString:", CFSTR("social"));
            }
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }
    else
    {
      v3 = 0;
    }

    v2 = v11;
  }

  return v3;
}

- (NSNumber)failureType
{
  void *v2;
  void *v3;

  -[SSAuthenticationResponse _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("failureType"), CFSTR("errorNumber"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v2, "intValue"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSNumber *)v3;
}

- (BOOL)isManagedStudent
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("isManagedStudent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (BOOL)isNewCustomer
{
  void *v2;
  char v3;

  -[SSAuthenticationResponse _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("newCustomer"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (id)newAccount
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  _UNKNOWN **v14;
  SSAccount *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[SSAuthenticationResponse accountUniqueIdentifier](self, "accountUniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
    objc_msgSend(v4, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x1E0C8F170]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v4;
    objc_msgSend(v4, "accountsWithAccountType:");
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v28;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v9);
        objc_msgSend(v10, "username");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSAuthenticationResponse accountName](self, "accountName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToString:", v12);

        if ((v13 & 1) != 0)
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          if (v7)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v14 = &off_1E47B6000;
      v15 = -[SSAccount initWithBackingAccount:]([SSAccount alloc], "initWithBackingAccount:", v10);

      if (v15)
        goto LABEL_13;
    }
    else
    {
LABEL_10:

      v14 = &off_1E47B6000;
    }
    v15 = (SSAccount *)objc_alloc_init((Class)v14[314]);
LABEL_13:
    -[SSAccount setAccountKind:](v15, "setAccountKind:", -[SSAuthenticationResponse accountKind](self, "accountKind"));
    -[SSAuthenticationResponse accountName](self, "accountName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSAccount setAccountName:](v15, "setAccountName:", v16);

    -[SSAccount setAccountScope:](v15, "setAccountScope:", SSAccountScopeForURLBagType(-[SSAuthenticationResponse URLBagType](self, "URLBagType")));
    -[SSAuthenticationResponse altDSID](self, "altDSID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSAccount setAltDSID:](v15, "setAltDSID:", v17);

    -[SSAccount setAvailableServiceTypes:](v15, "setAvailableServiceTypes:", -[SSAuthenticationResponse availableServiceTypes](self, "availableServiceTypes"));
    -[SSAuthenticationResponse creditsString](self, "creditsString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSAccount setCreditsString:](v15, "setCreditsString:", v18);

    -[SSAccount setEnabledServiceTypes:](v15, "setEnabledServiceTypes:", -[SSAuthenticationResponse enabledServiceTypes](self, "enabledServiceTypes"));
    -[SSAccount setManagedAppleID:](v15, "setManagedAppleID:", -[SSAuthenticationResponse isManagedStudent](self, "isManagedStudent"));
    -[SSAccount setNewCustomer:](v15, "setNewCustomer:", -[SSAuthenticationResponse isNewCustomer](self, "isNewCustomer"));
    -[SSAuthenticationResponse token](self, "token");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSAccount setSecureToken:](v15, "setSecureToken:", v19);

    -[SSAuthenticationResponse storeFrontIdentifier](self, "storeFrontIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSAccount setStoreFrontIdentifier:](v15, "setStoreFrontIdentifier:", v20);

    -[SSAccount setUniqueIdentifier:](v15, "setUniqueIdentifier:", v3);
    -[SSAuthenticationResponse _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("address"), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v21, "objectForKey:", CFSTR("firstName"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[SSAccount setFirstName:](v15, "setFirstName:", v22);
      objc_msgSend(v21, "objectForKey:", CFSTR("lastName"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[SSAccount setLastName:](v15, "setLastName:", v23);

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (int64_t)responseType
{
  void *v3;
  int64_t v4;
  void *v5;
  int64_t v6;

  -[SSAuthenticationResponse _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("failureType"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = -[SSAuthenticationResponse _responseTypeForFailureType:](self, "_responseTypeForFailureType:", objc_msgSend(v3, "integerValue"));
LABEL_7:
    v6 = v4;
    goto LABEL_8;
  }
  -[SSAuthenticationResponse _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("errorNumber"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    -[SSAuthenticationResponse _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("status"), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v6 = 3;
      goto LABEL_8;
    }
    v4 = -[SSAuthenticationResponse _responseTypeForStatusValue:](self, "_responseTypeForStatusValue:", objc_msgSend(v3, "integerValue"));
    goto LABEL_7;
  }
  v6 = -[SSAuthenticationResponse _responseTypeForErrorNumber:](self, "_responseTypeForErrorNumber:", objc_msgSend(v5, "integerValue"));
  v3 = v5;
LABEL_8:

  return v6;
}

- (NSString)storeFrontIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[NSHTTPURLResponse allHeaderFields](self->_urlResponse, "allHeaderFields");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("X-Set-Apple-Store-Front"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(CFSTR("X-Set-Apple-Store-Front"), "lowercaseString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      objc_msgSend(v2, "objectForKey:", CFSTR("X-Apple-Request-Store-Front"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
        objc_msgSend(CFSTR("X-Apple-Request-Store-Front"), "lowercaseString");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "objectForKey:", v5);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v3)
        {
          +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "localAccount");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "resultWithError:", 0);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "storeFrontIdentifier");
          v3 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v3)
          {
            +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v9)
            {
              +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
              v9 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v10 = objc_msgSend(v9, "shouldLog");
            if (objc_msgSend(v9, "shouldLogToDisk"))
              v11 = v10 | 2;
            else
              v11 = v10;
            objc_msgSend(v9, "OSLogObject");
            v12 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
              v11 &= 2u;
            if (v11)
            {
              LODWORD(v23) = 138543362;
              *(_QWORD *)((char *)&v23 + 4) = objc_opt_class();
              v13 = *(id *)((char *)&v23 + 4);
              LODWORD(v22) = 12;
              v14 = (void *)_os_log_send_and_compose_impl();

              if (!v14)
              {
LABEL_17:

                v3 = 0;
                goto LABEL_18;
              }
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v14, 4, &v23, v22, v23);
              v12 = objc_claimAutoreleasedReturnValue();
              free(v14);
              SSFileLog(v9, CFSTR("%@"), v15, v16, v17, v18, v19, v20, (uint64_t)v12);
            }

            goto LABEL_17;
          }
        }
      }
    }
  }
LABEL_18:

  return (NSString *)v3;
}

- (NSString)token
{
  void *v3;
  id v4;
  void *v5;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("xToken"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (v4 = v3, (v5 = v4) == 0))
  {
    -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("passwordToken"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v5;
      v5 = v4;
    }
    else
    {
      v4 = 0;
    }
  }

  return (NSString *)v4;
}

- (NSHTTPURLResponse)URLResponse
{
  return self->_urlResponse;
}

- (NSString)userMessage
{
  void *v2;
  id v3;

  -[SSAuthenticationResponse _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", CFSTR("customerMessage"), CFSTR("errorKey"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;

  return (NSString *)v3;
}

- (int64_t)_responseTypeForErrorNumber:(int64_t)a3
{
  if ((unint64_t)(a3 - 9007) > 2)
    return 3;
  else
    return qword_1A27A0F08[a3 - 9007];
}

- (int64_t)_responseTypeForFailureType:(int64_t)a3
{
  int64_t v3;

  v3 = 3;
  if (a3 == -128)
    v3 = 1;
  if (a3 == -5000)
    return 2;
  else
    return v3;
}

- (int64_t)_responseTypeForStatusValue:(int64_t)a3
{
  int64_t v3;

  v3 = 3;
  if (a3 == -128)
    v3 = 1;
  if (!a3)
    v3 = 0;
  if (a3 == -5000)
    return 2;
  else
    return v3;
}

- (id)_valueForFirstAvailableKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id *v7;
  id v8;
  BOOL v9;
  id *v11;
  uint64_t v12;

  v4 = a3;
  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("accountInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id *)&v12;
  if (v4)
  {
    do
    {
      -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        objc_msgSend(v5, "objectForKey:", v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v7 = v11++;
      v8 = *v7;

      if (v8)
        v9 = v6 == 0;
      else
        v9 = 0;
      v4 = v8;
    }
    while (v9);
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }

  return v6;
}

- (NSDictionary)responseDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)URLBagType
{
  return self->_urlBagType;
}

- (void)setURLBagType:(int64_t)a3
{
  self->_urlBagType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlResponse, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

@end
