@implementation ICDelegateAccountStoreReader

- (ICDelegateAccountStoreReader)initWithConnection:(id)a3
{
  id v5;
  ICDelegateAccountStoreReader *v6;
  ICDelegateAccountStoreReader *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICDelegateAccountStoreReader;
  v6 = -[ICDelegateAccountStoreReader init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v7->_isValid = 1;
  }

  return v7;
}

- (void)invalidate
{
  ICSQLiteConnection *connection;

  connection = self->_connection;
  self->_connection = 0;

  self->_isValid = 0;
}

- (void)enumerateDelegationUUIDsForUserIdentity:(id)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  ICSQLiteConnection *connection;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v10 = a3;
  v6 = a4;
  if (!self->_isValid)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Out-of-scope transaction usage: %@"), self);
  ICDelegateAccountStorePrimaryKeyForUserIdentity(v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Non-concrete user identity: %@"), v10);
  connection = self->_connection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__ICDelegateAccountStoreReader_enumerateDelegationUUIDsForUserIdentity_usingBlock___block_invoke;
  v11[3] = &unk_1E4390408;
  v11[4] = v7;
  v12 = v6;
  v9 = v6;
  -[ICSQLiteConnection executeQuery:withResults:](connection, "executeQuery:withResults:", CFSTR("SELECT uuid FROM delegation_uuid WHERE user_identity==?"), v11);

}

- (void)enumerateTokensUsingBlock:(id)a3
{
  id v4;
  ICSQLiteConnection *connection;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (!self->_isValid)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Out-of-scope transaction usage: %@"), self);
  connection = self->_connection;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__ICDelegateAccountStoreReader_enumerateTokensUsingBlock___block_invoke;
  v7[3] = &unk_1E4390408;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[ICSQLiteConnection executeQuery:withResults:](connection, "executeQuery:withResults:", CFSTR("SELECT data, expiration_date, type, account_identity FROM token WHERE (expiration_date IS NULL) OR (expiration_date >= ?)"), v7);

}

- (void)enumerateTokensWithType:(int64_t)a3 usingBlock:(id)a4
{
  id v6;
  ICSQLiteConnection *connection;
  id v8;
  _QWORD v9[5];
  id v10;
  int64_t v11;

  v6 = a4;
  if (!self->_isValid)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Out-of-scope transaction usage: %@"), self);
  connection = self->_connection;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__ICDelegateAccountStoreReader_enumerateTokensWithType_usingBlock___block_invoke;
  v9[3] = &unk_1E4390430;
  v10 = v6;
  v11 = a3;
  v9[4] = self;
  v8 = v6;
  -[ICSQLiteConnection executeQuery:withResults:](connection, "executeQuery:withResults:", CFSTR("SELECT data, expiration_date, type, account_identity FROM token WHERE (type == ?) AND ((expiration_date IS NULL) OR (expiration_date >= ?))"), v9);

}

- (id)identityPropertiesForUserIdentity:(id)a3
{
  id v4;
  void *v5;
  ICSQLiteConnection *connection;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  ICDelegateAccountStoreReader *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__32687;
  v18 = __Block_byref_object_dispose__32688;
  v19 = 0;
  if (!self->_isValid)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Out-of-scope transaction usage: %@"), self);
  ICDelegateAccountStorePrimaryKeyForUserIdentity(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Non-concrete user identity: %@"), v4);
  connection = self->_connection;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__ICDelegateAccountStoreReader_identityPropertiesForUserIdentity___block_invoke;
  v10[3] = &unk_1E4390480;
  v10[4] = v5;
  v13 = &v14;
  v7 = v4;
  v11 = v7;
  v12 = self;
  -[ICSQLiteConnection executeQuery:withResults:](connection, "executeQuery:withResults:", CFSTR("SELECT account.storefront AS storefront, token.data AS data, token.expiration_date AS expiration_date, token.type AS type FROM account LEFT OUTER JOIN token ON account.identity==token.account_identity WHERE account.identity==?"), v10);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (NSDate)lastExpirationPruningDate
{
  ICSQLiteConnection *connection;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  if (!self->_isValid)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Out-of-scope transaction usage: %@"), self);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__32687;
  v11 = __Block_byref_object_dispose__32688;
  v12 = 0;
  connection = self->_connection;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__ICDelegateAccountStoreReader_lastExpirationPruningDate__block_invoke;
  v6[3] = &unk_1E4390D40;
  v6[4] = &v7;
  -[ICSQLiteConnection executeQuery:withResults:](connection, "executeQuery:withResults:", CFSTR("SELECT value FROM metadata WHERE key==?"), v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDate *)v4;
}

- (int64_t)overestimatedNumberOfTokens
{
  ICSQLiteConnection *connection;
  int64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  if (!self->_isValid)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Out-of-scope transaction usage: %@"), self);
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  connection = self->_connection;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__ICDelegateAccountStoreReader_overestimatedNumberOfTokens__block_invoke;
  v6[3] = &unk_1E4390D40;
  v6[4] = &v7;
  -[ICSQLiteConnection executeQuery:withResults:](connection, "executeQuery:withResults:", CFSTR("SELECT count(account_identity) FROM token"), v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)tokenForUserIdentity:(id)a3
{
  id v4;
  void *v5;
  ICSQLiteConnection *connection;
  id v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  if (!self->_isValid)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Out-of-scope transaction usage: %@"), self);
  ICDelegateAccountStorePrimaryKeyForUserIdentity(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Non-concrete user identity: %@"), v4);
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__32687;
  v14 = __Block_byref_object_dispose__32688;
  v15 = 0;
  connection = self->_connection;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__ICDelegateAccountStoreReader_tokenForUserIdentity___block_invoke;
  v9[3] = &unk_1E43904D8;
  v9[4] = v5;
  v9[5] = self;
  v9[6] = &v10;
  -[ICSQLiteConnection executeQuery:withResults:](connection, "executeQuery:withResults:", CFSTR("SELECT data, expiration_date, type FROM token WHERE account_identity==?"), v9);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (void)_enumerateQueryResults:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__ICDelegateAccountStoreReader__enumerateQueryResults_usingBlock___block_invoke;
  v8[3] = &unk_1E4390500;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a3, "enumerateRowsUsingBlock:", v8);

}

- (id)_tokenWithSQLiteRow:(id)a3
{
  id v3;
  uint64_t v4;
  ICDelegateToken *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = objc_msgSend(v3, "int64ForColumnName:", CFSTR("type"));
  if (v4 == 1)
  {
    v6 = 0;
  }
  else
  {
    v5 = 0;
    if (v4 != 2)
      goto LABEL_12;
    v6 = 1;
  }
  objc_msgSend(v3, "dataForColumnName:", CFSTR("data"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v3, "numberForColumnName:", CFSTR("expiration_date"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "doubleValue");
      +[ICDelegateAccountStoreSchema dateForValue:](ICDelegateAccountStoreSchema, "dateForValue:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    v5 = -[ICDelegateToken initWithType:data:expirationDate:]([ICDelegateToken alloc], "initWithType:data:expirationDate:", v6, v7, v10);

  }
  else
  {
    v5 = 0;
  }

LABEL_12:
  return v5;
}

- (id)_userIdentityWithSQLiteRow:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "stringForColumnName:", CFSTR("account_identity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  if (v4)
  {
    if (v4 < 40)
    {
      v5 = (void *)strtoull((const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"), 0, 10);
      if (v5)
      {
        v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", v5);
        +[ICUserIdentity specificAccountWithDSID:](ICUserIdentity, "specificAccountWithDSID:", v6);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      +[ICUserIdentity carrierBundleWithDeviceIdentifier:](ICUserIdentity, "carrierBundleWithDeviceIdentifier:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

void __66__ICDelegateAccountStoreReader__enumerateQueryResults_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  BOOL v6;
  id v7;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = a2;
    objc_msgSend(v3, "_userIdentityWithSQLiteRow:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_tokenWithSQLiteRow:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v6 = v5 == 0;
    else
      v6 = 1;
    if (!v6)
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

void __53__ICDelegateAccountStoreReader_tokenForUserIdentity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  __int128 v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindString:atPosition:", v3, 1);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__ICDelegateAccountStoreReader_tokenForUserIdentity___block_invoke_2;
  v5[3] = &unk_1E43904B0;
  v6 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v4, "enumerateRowsUsingBlock:", v5);

}

void __53__ICDelegateAccountStoreReader_tokenForUserIdentity___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_tokenWithSQLiteRow:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isExpired") & 1) == 0)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v6);

  }
  *a4 = 1;
}

uint64_t __59__ICDelegateAccountStoreReader_overestimatedNumberOfTokens__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "firstInt64Value");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __57__ICDelegateAccountStoreReader_lastExpirationPruningDate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "bindString:atPosition:", CFSTR("expiration_prune"), 1);
  objc_msgSend(v3, "firstNumberValue");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v8;
  if (v8)
  {
    objc_msgSend(v8, "doubleValue");
    +[ICDelegateAccountStoreSchema dateForValue:](ICDelegateAccountStoreSchema, "dateForValue:");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v4 = v8;
  }

}

void __66__ICDelegateAccountStoreReader_identityPropertiesForUserIdentity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint64_t v10;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindString:atPosition:", v3, 1);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__ICDelegateAccountStoreReader_identityPropertiesForUserIdentity___block_invoke_2;
  v7[3] = &unk_1E4390458;
  v10 = *(_QWORD *)(a1 + 56);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v8 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateRowsUsingBlock:", v7);

}

void __66__ICDelegateAccountStoreReader_identityPropertiesForUserIdentity___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  ICMutableUserIdentityProperties *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  if (a2)
  {
    v6 = a2;
    v7 = objc_alloc_init(ICMutableUserIdentityProperties);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 32), "deviceIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCarrierBundleDeviceIdentifier:", v11);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setDelegated:", 1);
    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 32), "DSID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDSID:", v13);

    v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(v6, "stringForColumnName:", CFSTR("storefront"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setStorefrontIdentifier:", v15);

    objc_msgSend(*(id *)(a1 + 40), "_tokenWithSQLiteRow:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 && (objc_msgSend(v16, "isExpired") & 1) == 0)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setDelegateToken:", v16);

  }
  *a4 = 1;
}

void __67__ICDelegateAccountStoreReader_enumerateTokensWithType_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0C99D68];
  v8 = a2;
  objc_msgSend(v3, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICDelegateAccountStoreSchema valueForDate:](ICDelegateAccountStoreSchema, "valueForDate:", v4);
  v6 = v5;

  if (*(_QWORD *)(a1 + 48) == 1)
    v7 = 2;
  else
    v7 = 1;
  objc_msgSend(v8, "bindInt64:atPosition:", v7, 1);
  objc_msgSend(v8, "bindDouble:atPosition:", 2, v6);
  objc_msgSend(*(id *)(a1 + 32), "_enumerateQueryResults:usingBlock:", v8, *(_QWORD *)(a1 + 40));

}

void __58__ICDelegateAccountStoreReader_enumerateTokensUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0C99D68];
  v7 = a2;
  objc_msgSend(v3, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICDelegateAccountStoreSchema valueForDate:](ICDelegateAccountStoreSchema, "valueForDate:", v4);
  v6 = v5;

  objc_msgSend(v7, "bindDouble:atPosition:", 1, v6);
  objc_msgSend(*(id *)(a1 + 32), "_enumerateQueryResults:usingBlock:", v7, *(_QWORD *)(a1 + 40));

}

void __83__ICDelegateAccountStoreReader_enumerateDelegationUUIDsForUserIdentity_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindString:atPosition:", v3, 1);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __83__ICDelegateAccountStoreReader_enumerateDelegationUUIDsForUserIdentity_usingBlock___block_invoke_2;
  v5[3] = &unk_1E43903E0;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "enumerateRowsUsingBlock:", v5);

}

void __83__ICDelegateAccountStoreReader_enumerateDelegationUUIDsForUserIdentity_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(a2, "stringForColumnName:", CFSTR("uuid"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

@end
