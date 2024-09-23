@implementation ICDelegateAccountStoreSQLWriter

- (ICDelegateAccountStoreSQLWriter)initWithConnection:(id)a3
{
  id v5;
  ICDelegateAccountStoreSQLWriter *v6;
  ICDelegateAccountStoreSQLWriter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICDelegateAccountStoreSQLWriter;
  v6 = -[ICDelegateAccountStoreSQLWriter init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v7->_isValid = 1;
  }

  return v7;
}

- (void)addDelegationUUIDs:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  ICSQLiteConnection *connection;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t i;
  uint64_t v25;
  ICSQLiteConnection *v26;
  ICSQLiteConnection *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  char v33;
  _QWORD v34[7];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!self->_isValid)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Out-of-scope transaction usage: %@"), self);
  ICDelegateAccountStorePrimaryKeyForUserIdentity(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Non-concrete user identity: %@"), v9);
  connection = self->_connection;
  v39 = 0;
  -[ICSQLiteConnection prepareStatement:error:](connection, "prepareStatement:error:", CFSTR("INSERT OR REPLACE INTO delegation_uuid (user_identity, uuid, insertion_date) VALUES (?, ?, ?)"), &v39);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v39;
  v15 = v14;
  if (!v13)
  {
    LOBYTE(v23) = 0;
    if (!v10)
      goto LABEL_19;
    goto LABEL_18;
  }
  v28 = v14;
  v29 = v9;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICDelegateAccountStoreSchema valueForDate:](ICDelegateAccountStoreSchema, "valueForDate:", v16);
  v18 = v17;

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v19 = v8;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v36;
    v23 = 1;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v36 != v22)
          objc_enumerationMutation(v19);
        v25 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        v26 = self->_connection;
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __88__ICDelegateAccountStoreSQLWriter_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke;
        v34[3] = &unk_1E438FBB0;
        v34[4] = v11;
        v34[5] = v25;
        v34[6] = v18;
        v23 &= -[ICSQLiteConnection executePreparedStatement:error:bindings:](v26, "executePreparedStatement:error:bindings:", v13, 0, v34);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v21);
  }
  else
  {
    LOBYTE(v23) = 1;
  }

  v9 = v29;
  v15 = v28;
  if (v10)
  {
LABEL_18:
    v27 = self->_connection;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __88__ICDelegateAccountStoreSQLWriter_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_2;
    v30[3] = &unk_1E4390B70;
    v32 = v10;
    v33 = v23;
    v31 = v15;
    -[ICSQLiteConnection dispatchAfterTransaction:](v27, "dispatchAfterTransaction:", v30);

  }
LABEL_19:

}

- (void)invalidate
{
  ICSQLiteConnection *connection;

  connection = self->_connection;
  self->_connection = 0;

  self->_isValid = 0;
}

- (void)removeAllTokensWithCompletionHandler:(id)a3
{
  id v4;
  BOOL v5;
  ICSQLiteConnection *connection;
  _QWORD v7[4];
  id v8;
  BOOL v9;

  v4 = a3;
  if (!self->_isValid)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Out-of-scope transaction usage: %@"), self);
  -[ICSQLiteConnection executeStatement:error:](self->_connection, "executeStatement:error:", CFSTR("DELETE FROM token"), 0);
  if (v4)
  {
    v5 = -[ICSQLiteConnection lastChangeCount](self->_connection, "lastChangeCount") > 0;
    connection = self->_connection;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __72__ICDelegateAccountStoreSQLWriter_removeAllTokensWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E438FBD8;
    v8 = v4;
    v9 = v5;
    -[ICSQLiteConnection dispatchAfterTransaction:](connection, "dispatchAfterTransaction:", v7);

  }
}

- (void)removeDelegationUUIDs:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  ICSQLiteConnection *connection;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t i;
  uint64_t v22;
  ICSQLiteConnection *v23;
  ICSQLiteConnection *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  char v30;
  _QWORD v31[6];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!self->_isValid)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Out-of-scope transaction usage: %@"), self);
  ICDelegateAccountStorePrimaryKeyForUserIdentity(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Non-concrete user identity: %@"), v9);
  connection = self->_connection;
  v36 = 0;
  -[ICSQLiteConnection prepareStatement:error:](connection, "prepareStatement:error:", CFSTR("DELETE FROM delegation_uuid WHERE user_identity==? AND uuid=?"), &v36);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v36;
  v15 = v14;
  if (!v13)
  {
    LOBYTE(v20) = 0;
    if (!v10)
      goto LABEL_19;
    goto LABEL_18;
  }
  v25 = v14;
  v26 = v9;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v16 = v8;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v33;
    v20 = 1;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v33 != v19)
          objc_enumerationMutation(v16);
        v22 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        v23 = self->_connection;
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __91__ICDelegateAccountStoreSQLWriter_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke;
        v31[3] = &unk_1E438FC00;
        v31[4] = v11;
        v31[5] = v22;
        v20 &= -[ICSQLiteConnection executePreparedStatement:error:bindings:](v23, "executePreparedStatement:error:bindings:", v13, 0, v31);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v18);
  }
  else
  {
    LOBYTE(v20) = 1;
  }

  v9 = v26;
  v15 = v25;
  if (v10)
  {
LABEL_18:
    v24 = self->_connection;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __91__ICDelegateAccountStoreSQLWriter_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_2;
    v27[3] = &unk_1E4390B70;
    v29 = v10;
    v30 = v20;
    v28 = v15;
    -[ICSQLiteConnection dispatchAfterTransaction:](v24, "dispatchAfterTransaction:", v27);

  }
LABEL_19:

}

- (void)removeIdentityPropertiesForUserIdentity:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  ICSQLiteConnection *connection;
  _QWORD v13[4];
  id v14;
  BOOL v15;
  BOOL v16;

  v6 = a3;
  v7 = a4;
  if (!self->_isValid)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Out-of-scope transaction usage: %@"), self);
  ICDelegateAccountStorePrimaryKeyForUserIdentity(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Non-concrete user identity: %@"), v6);
  v9 = -[ICDelegateAccountStoreSQLWriter _removeAccountForIdentityKey:](self, "_removeAccountForIdentityKey:", v8);
  v10 = -[ICDelegateAccountStoreSQLWriter _removeTokenForIdentityKey:](self, "_removeTokenForIdentityKey:", v8);
  if (v7)
  {
    v11 = v10;
    connection = self->_connection;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __93__ICDelegateAccountStoreSQLWriter_removeIdentityPropertiesForUserIdentity_completionHandler___block_invoke;
    v13[3] = &unk_1E438FC28;
    v14 = v7;
    v15 = v9;
    v16 = v11;
    -[ICSQLiteConnection dispatchAfterTransaction:](connection, "dispatchAfterTransaction:", v13);

  }
}

- (void)removeTokenForUserIdentity:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  ICSQLiteConnection *connection;
  _QWORD v12[4];
  id v13;
  BOOL v14;

  v6 = a3;
  v7 = a4;
  if (!self->_isValid)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Out-of-scope transaction usage: %@"), self);
  ICDelegateAccountStorePrimaryKeyForUserIdentity(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Non-concrete user identity: %@"), v6);
  v9 = -[ICDelegateAccountStoreSQLWriter _removeTokenForIdentityKey:](self, "_removeTokenForIdentityKey:", v8);
  if (v7)
  {
    v10 = v9;
    connection = self->_connection;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __80__ICDelegateAccountStoreSQLWriter_removeTokenForUserIdentity_completionHandler___block_invoke;
    v12[3] = &unk_1E438FBD8;
    v13 = v7;
    v14 = v10;
    -[ICSQLiteConnection dispatchAfterTransaction:](connection, "dispatchAfterTransaction:", v12);

  }
}

- (void)removeTokensExpiringBeforeDate:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  ICSQLiteConnection *connection;
  uint64_t v9;
  id v10;
  int64_t v11;
  ICSQLiteConnection *v12;
  id v13;
  ICSQLiteConnection *v14;
  _QWORD v15[4];
  id v16;
  BOOL v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v6 = a3;
  v7 = a4;
  if (!self->_isValid)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Out-of-scope transaction usage: %@"), self);
  connection = self->_connection;
  v9 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __84__ICDelegateAccountStoreSQLWriter_removeTokensExpiringBeforeDate_completionHandler___block_invoke;
  v20[3] = &unk_1E438FC50;
  v10 = v6;
  v21 = v10;
  -[ICSQLiteConnection executeStatement:error:bindings:](connection, "executeStatement:error:bindings:", CFSTR("DELETE FROM token WHERE expiration_date<?"), 0, v20);
  v11 = -[ICSQLiteConnection lastChangeCount](self->_connection, "lastChangeCount");
  v12 = self->_connection;
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __84__ICDelegateAccountStoreSQLWriter_removeTokensExpiringBeforeDate_completionHandler___block_invoke_2;
  v18[3] = &unk_1E438FC50;
  v13 = v10;
  v19 = v13;
  -[ICSQLiteConnection executeStatement:error:bindings:](v12, "executeStatement:error:bindings:", CFSTR("INSERT OR REPLACE INTO metadata (key, value) VALUES (?, ?)"), 0, v18);
  if (v7)
  {
    v14 = self->_connection;
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __84__ICDelegateAccountStoreSQLWriter_removeTokensExpiringBeforeDate_completionHandler___block_invoke_3;
    v15[3] = &unk_1E438FBD8;
    v16 = v7;
    v17 = v11 > 0;
    -[ICSQLiteConnection dispatchAfterTransaction:](v14, "dispatchAfterTransaction:", v15);

  }
}

- (void)setIdentityProperties:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  ICSQLiteConnection *connection;
  id v14;
  void *v15;
  ICSQLiteConnection *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!self->_isValid)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Out-of-scope transaction usage: %@"), self);
  ICDelegateAccountStorePrimaryKeyForUserIdentity(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Non-concrete user identity: %@"), v9);
  v12 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __91__ICDelegateAccountStoreSQLWriter_setIdentityProperties_forUserIdentity_completionHandler___block_invoke;
  v19[3] = &unk_1E438FC00;
  v19[4] = v11;
  v14 = v8;
  v20 = v14;
  -[ICSQLiteConnection executeStatement:error:bindings:](connection, "executeStatement:error:bindings:", CFSTR("INSERT OR REPLACE INTO account (identity, storefront) VALUES (?, ?)"), 0, v19);
  objc_msgSend(v14, "delegateToken");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    -[ICDelegateAccountStoreSQLWriter _removeTokenForIdentityKey:](self, "_removeTokenForIdentityKey:", v11);
    if (!v10)
      goto LABEL_8;
    goto LABEL_7;
  }
  -[ICDelegateAccountStoreSQLWriter _setToken:forIdentityKey:](self, "_setToken:forIdentityKey:", v15, v11);
  if (v10)
  {
LABEL_7:
    v16 = self->_connection;
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __91__ICDelegateAccountStoreSQLWriter_setIdentityProperties_forUserIdentity_completionHandler___block_invoke_2;
    v17[3] = &unk_1E4390D18;
    v18 = v10;
    -[ICSQLiteConnection dispatchAfterTransaction:](v16, "dispatchAfterTransaction:", v17);

  }
LABEL_8:

}

- (void)setToken:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  ICSQLiteConnection *connection;
  _QWORD v13[4];
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!self->_isValid)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Out-of-scope transaction usage: %@"), self);
  ICDelegateAccountStorePrimaryKeyForUserIdentity(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Non-concrete user identity: %@"), v9);
  -[ICDelegateAccountStoreSQLWriter _setToken:forIdentityKey:](self, "_setToken:forIdentityKey:", v8, v11);
  if (v10)
  {
    connection = self->_connection;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __78__ICDelegateAccountStoreSQLWriter_setToken_forUserIdentity_completionHandler___block_invoke;
    v13[3] = &unk_1E4390D18;
    v14 = v10;
    -[ICSQLiteConnection dispatchAfterTransaction:](connection, "dispatchAfterTransaction:", v13);

  }
}

- (BOOL)_removeAccountForIdentityKey:(id)a3
{
  id v4;
  ICSQLiteConnection *connection;
  id v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  connection = self->_connection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__ICDelegateAccountStoreSQLWriter__removeAccountForIdentityKey___block_invoke;
  v8[3] = &unk_1E438FC50;
  v9 = v4;
  v6 = v4;
  -[ICSQLiteConnection executeStatement:error:bindings:](connection, "executeStatement:error:bindings:", CFSTR("DELETE FROM account WHERE identity==?"), 0, v8);
  LOBYTE(self) = -[ICSQLiteConnection lastChangeCount](self->_connection, "lastChangeCount") > 0;

  return (char)self;
}

- (BOOL)_removeTokenForIdentityKey:(id)a3
{
  id v4;
  ICSQLiteConnection *connection;
  id v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  connection = self->_connection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__ICDelegateAccountStoreSQLWriter__removeTokenForIdentityKey___block_invoke;
  v8[3] = &unk_1E438FC50;
  v9 = v4;
  v6 = v4;
  -[ICSQLiteConnection executeStatement:error:bindings:](connection, "executeStatement:error:bindings:", CFSTR("DELETE FROM token WHERE account_identity==?"), 0, v8);
  LOBYTE(self) = -[ICSQLiteConnection lastChangeCount](self->_connection, "lastChangeCount") > 0;

  return (char)self;
}

- (void)_setToken:(id)a3 forIdentityKey:(id)a4
{
  id v6;
  id v7;
  ICSQLiteConnection *connection;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  connection = self->_connection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__ICDelegateAccountStoreSQLWriter__setToken_forIdentityKey___block_invoke;
  v11[3] = &unk_1E438FC00;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  -[ICSQLiteConnection executeStatement:error:bindings:](connection, "executeStatement:error:bindings:", CFSTR("INSERT OR REPLACE INTO token (account_identity, data, expiration_date, type) VALUES(?, ?, ?, ?)"), 0, v11);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

void __60__ICDelegateAccountStoreSQLWriter__setToken_forIdentityKey___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "bindString:atPosition:", *(_QWORD *)(a1 + 32), 1);
  objc_msgSend(*(id *)(a1 + 40), "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bindData:atPosition:", v3, 2);

  objc_msgSend(*(id *)(a1 + 40), "expirationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[ICDelegateAccountStoreSchema valueForDate:](ICDelegateAccountStoreSchema, "valueForDate:", v4);
    objc_msgSend(v6, "bindDouble:atPosition:", 3);
  }
  else
  {
    objc_msgSend(v6, "bindNullAtPosition:", 3);
  }
  if (objc_msgSend(*(id *)(a1 + 40), "type") == 1)
    v5 = 2;
  else
    v5 = 1;
  objc_msgSend(v6, "bindInt64:atPosition:", v5, 4);

}

uint64_t __62__ICDelegateAccountStoreSQLWriter__removeTokenForIdentityKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindString:atPosition:", *(_QWORD *)(a1 + 32), 1);
}

uint64_t __64__ICDelegateAccountStoreSQLWriter__removeAccountForIdentityKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindString:atPosition:", *(_QWORD *)(a1 + 32), 1);
}

uint64_t __78__ICDelegateAccountStoreSQLWriter_setToken_forUserIdentity_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __91__ICDelegateAccountStoreSQLWriter_setIdentityProperties_forUserIdentity_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindString:atPosition:", v3, 1);
  objc_msgSend(*(id *)(a1 + 40), "storefrontIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (id)v5;
  if (v5)
    objc_msgSend(v4, "bindString:atPosition:", v5, 2);
  else
    objc_msgSend(v4, "bindNullAtPosition:", 2);

}

uint64_t __91__ICDelegateAccountStoreSQLWriter_setIdentityProperties_forUserIdentity_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __84__ICDelegateAccountStoreSQLWriter_removeTokensExpiringBeforeDate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  +[ICDelegateAccountStoreSchema valueForDate:](ICDelegateAccountStoreSchema, "valueForDate:", v2);
  objc_msgSend(v3, "bindDouble:atPosition:", 1);

}

void __84__ICDelegateAccountStoreSQLWriter_removeTokensExpiringBeforeDate_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  double v3;
  double v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  +[ICDelegateAccountStoreSchema valueForDate:](ICDelegateAccountStoreSchema, "valueForDate:", v2);
  v4 = v3;
  objc_msgSend(v5, "bindString:atPosition:", CFSTR("expiration_prune"), 1);
  objc_msgSend(v5, "bindDouble:atPosition:", 2, v4);

}

uint64_t __84__ICDelegateAccountStoreSQLWriter_removeTokensExpiringBeforeDate_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

uint64_t __80__ICDelegateAccountStoreSQLWriter_removeTokenForUserIdentity_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

uint64_t __93__ICDelegateAccountStoreSQLWriter_removeIdentityPropertiesForUserIdentity_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _BOOL8 v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
    v3 = 1;
  else
    v3 = *(unsigned __int8 *)(a1 + 41) != 0;
  return (*(uint64_t (**)(uint64_t, _BOOL8, _QWORD))(v2 + 16))(v2, v3, 0);
}

void __91__ICDelegateAccountStoreSQLWriter_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindString:atPosition:", v3, 1);
  objc_msgSend(v4, "bindString:atPosition:", *(_QWORD *)(a1 + 40), 2);

}

uint64_t __91__ICDelegateAccountStoreSQLWriter_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __72__ICDelegateAccountStoreSQLWriter_removeAllTokensWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

void __88__ICDelegateAccountStoreSQLWriter_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindString:atPosition:", v3, 1);
  objc_msgSend(v4, "bindString:atPosition:", *(_QWORD *)(a1 + 40), 2);
  objc_msgSend(v4, "bindDouble:atPosition:", 3, *(double *)(a1 + 48));

}

uint64_t __88__ICDelegateAccountStoreSQLWriter_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

@end
